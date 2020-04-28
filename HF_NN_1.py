import torch
from torch.utils.data import Dataset, DataLoader, TensorDataset
import torch.nn as nn
import torch.nn.functional as F

X_train = pd.DataFrame(X_train)
X_test = pd.DataFrame(X_test)
y_train = pd.DataFrame(y_train)
y_test = pd.DataFrame(y_test)

# Prepare the data for torch nn
train_x = torch.tensor(X_train.values.astype(np.float32))
train_y = torch.tensor(y_train.values.astype(np.int_))

test_x = torch.tensor(X_test.values.astype(np.float32))
test_y = torch.tensor(y_test.values.astype(np.int_))

train_data = TensorDataset(train_x, train_y)
train_loader = DataLoader(dataset=train_data, batch_size=36, shuffle=True)

validation_data = TensorDataset(test_x, test_y)
validation_loader = DataLoader(dataset=validation_data, batch_size=15, shuffle=True)


class SimpleNN(nn.Module):
    def __init__(self):
        super(SimpleNN, self).__init__()
        # declaring some parameters
        self.inputSize = 156
        self.outputSize = 2
        self.hidden1Size = 500
        #         self.hidden2Size = 200
        #         self.hidden3Size = 20

        # layers of linear transformation
        self.hidden1 = nn.Linear(self.inputSize, self.hidden1Size)
        #         self.hidden2 = nn.Linear(self.hidden1Size, self.hidden2Size)
        #         self.hidden3 = nn.Linear(self.hidden2Size, self.hidden3Size)
        self.output = nn.Linear(self.hidden1Size, self.outputSize)

        # # sigmoid activation and softmax output
        # self.sigmoid = nn.Sigmoid()
        # self.softmax = nn.Softmax(dim=1)

    def forward(self, x):
        x = torch.sigmoid(self.hidden1(x))
        #         x = torch.sigmoid(self.hidden2(x))
        #         x = torch.sigmoid(self.hidden3(x))
        y = F.softmax(self.output(x), dim=1)

        return y


model = SimpleNN()
optimizer = torch.optim.SGD(model.parameters(), lr=0.01, momentum=0.5)
criterion = nn.CrossEntropyLoss()


def train(epoch, log_interval=20):
    # set model to training mode
    model.train()

    # loop over batch from the training set
    for batch_idx, (data, target) in enumerate(train_loader):
        # Zero gradient buffers
        optimizer.zero_grad()

        # pass data through the network
        output = model(data)

        # calculate loss
        loss = criterion(output, target)

        # Backpropagate
        loss.backward()

        # Update Weights
        optimizer.step()

    print('Train Epoch: {} [{}/{} ({:.0f}%)]\tLoss: {:.6f}'.format(
        epoch, batch_idx * len(data), len(train_loader.dataset),
        100. * batch_idx / len(train_loader), loss.data.item()))

    return


def validate(loss_vector, accuracy_vector):
    model.eval()
    val_loss, correct = 0, 0
    for data, target in validation_loader:
        output = model(data)
        val_loss += criterion(output, target).data.item()
        pred = output.data.max(1)[1]
        correct += pred.eq(target.data).sum()

        val_loss /= len(validation_loader)
        loss_vector.append(val_loss)
        accuracy = 100. * correct.to(torch.float32) / len(validation_loader.dataset)
        accuracy_vector.append(accuracy)

    print('\nValidation set: Average loss: {:.4f}, Accuracy: {}/{} ({:.0f}%)\n'.format(
        val_loss, correct, len(validation_loader.dataset), accuracy))


num_epochs = 50
lossv, accv = [], []

for epoch in range(1, num_epochs + 1):
    train(epoch)
    validate(lossv, accv)

