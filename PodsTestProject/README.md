# PodsTestProject

## Project Overview

### App Overview
- **Name:** PodsTestProject
- **Platform:** iOS
- **Framework:** UIKit
- **Language:** Swift
- **Architectural pattern:** MVVM + Router
- **Libraries:** UIKit, SnapKit

### App Features
#### PodsView Screen:
- Displays a scrollable list of repositories from the "square" organization on GitHub.
- Each repository item shows the name and description.

### App Development Approach
- Implemented using MVVM (Model-View-ViewModel) + Router architecture.
- Utilizes minimum libraries (SnapKit) to minimize dependencies.
- Emphasizes test coverage for improved reliability and reusability.
- Designed for extensibility by future developers.

### Data Source
- **API Used:** GitHub Open API
- **URL:** [https://api.github.com/orgs/square/repos](https://api.github.com/orgs/square/repos)

### Network Layer
- **URLSession:** Utilizes URLSession for asynchronous network requests and image fetching.
- Implements methods for performing network requests and fetching images from remote URLs.

### NetworkServiciable Protocol
- Defines methods for interacting with the network layer to fetch JSON data and images from URLs.
- Acts as the bridge between the ViewModels and the underlying Network Manager implementation.

### Data Models
- **Square:**
  - Struct conforming to Decodable protocol.
  - Represents information about a repository fetched from the server.
  
- **PodsPreviewModel:**
  - Represents model for saving strings and loaded omage from server.
  
### Data Binding
- Achieves data binding from ViewModel to ViewController using protocols and closures.

### Failure States
- Enum Constants for Failure States:
  - `invalidURL`: Indicates an invalid URL error.
  - `invalidData`: Indicates errors due to corrupt or invalid data.
  - `generalMessage`: Represents general failure or error states.

### Unit Tests
- Unit tests for ViewModels validate successful fetching of GitHub repositories.
- Utilizes mock data to verify repository values and ensures proper invocation of updateView closures.

### UI Tests
- UI tests validate the display and interaction of table views.
- Verifies existence and interaction with table view cells using XCTest.
- UI tests validate the display and interaction of launch screen.

## Setup and Usage
**Download the folder in Zip**








# FlightTicketView

Simple UIViewController containing a UITableView with custom Cells that resemble a flight ticket with holes and separator.

## Screenshots

<img src="Screenshots/portrait.png" height="600"> 

## Requirements

- iOS 10.2+
- Xcode 9

## Integration

#### CocoaPods (iOS 8+)

You can use [CocoaPods](http://cocoapods.org/) to install `FlightTicketView` by adding it to your `Podfile`:

```ruby
target 'MyApp' do
    pod 'FlightTicketView'
end
```

## Deployment

Start by importing the framework to your project
```swift
import FlightTicketView
```

Subclass UITicketViewController and set the FlightTicketView container frame
```swift
class ViewController: UITicketViewController {
    override func viewDidLoad() {
    super.viewDidLoad()
    ticketViewContainer = self.view
    addTickets()
    }
}
```

Create addTickets() method and fill the tickets array
```swift
func addTickets() {
    // Create a stop over
    let stopOver = StopOver(id: 1,
    airlineName: "Aeromexico",
    airlineLogo: UIImage(named: "airlineExample1") ?? UIImage(),
    departureTime: Date(),
    arrivalTime: Date(),
    departureCity: "MEXICO",
    arrivalCity: "MADRID")

    // Create a flight ticket with the stop over
    // previously created
    let flightTicket = Ticket(id: 1,
    departureCityShort: "MEX",
    departureCityLong: "Cd. México",
    arrivalCityShort: "AMS",
    arrivalCityLong: "Amsterdam",
    stopOvers: [stopOver])

    // Fill array of tickets
    tickets = [flightTicket]
    ticketsTableView.reloadData()
}
```

That's it! you can add as many stop overs and tickets as you want.
Don't forget to check out the demo project for more ideas.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
