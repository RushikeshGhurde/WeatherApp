<<<<<<< HEAD
Weather Tracker Application

Overview:-
This Ruby on Rails application allows users to view and track the temperature data of 25 predefined cities. The temperature data is updated daily using an external weather API. The application includes user authentication and can optionally provide real-time updates using WebSockets.

Features:-

User Authentication: Users can sign up, log in, log out, and reset their passwords using Devise.
City and Temperature Data: Displays temperature data for predefined cities with historic data for the past 7 days.
API Integration: Fetches temperature data daily for 25 cities from an external weather API.
Background Jobs: Updates temperature data daily using a scheduled background job.
Responsive User Interface: Users can view temperature trends in a user-friendly and responsive dashboard.
WebSockets (Bonus): Real-time updates for temperature data using ActionCable.
Comprehensive Testing: Includes unit and integration tests for all major functionalities.

Requirements:-

Ruby 3.x
Rails 7.x
PostgreSQL
Redis (for background jobs and WebSocket functionality)
Node.js & Yarn
Bundler
1. Install Dependencies
bash
bundle install
yarn install
2. Database Setup
bash
Copy code
rails db:create
rails db:migrate
3. Configure API Keys
Create a .env file in the root directory.
Add your weather API key to the .env file:
bash
Copy code
WEATHER_API_KEY=your_api_key_here
4. Seed the Database
bash
Copy code
rails db:seed
5. Run the Application
bash
Copy code
rails server
6. Run Background Jobs
Ensure Redis is running, then start Sidekiq for background jobs:

bash
Copy code
bundle exec sidekiq
7. Testing
Run the test suite to ensure everything is working as expected:

bash
Copy code
rspec
Usage
Dashboard: After logging in, users can view the latest temperature data for all 25 cities on the dashboard.
City Details: Clicking on a city will show a detailed view with a graph of temperatures over the past 7 days.
Real-Time Updates (if implemented): Receive live temperature updates directly on the dashboard without refreshing the page.
Background Jobs
The application uses a background job to fetch and update temperature data daily. This job is scheduled using Sidekiq and runs automatically. Ensure that Sidekiq is running for the background job to function correctly.

API Integration
This application uses an external weather API to fetch temperature data. Ensure that you have registered and obtained an API key from a provider like OpenWeatherMap or Weatherstack.

WebSockets (Optional)
If you choose to implement real-time updates using WebSockets, ensure that Redis is configured correctly and that ActionCable is running.

Documentation
Detailed documentation for setting up and running the application is available in the docs directory of the repository.
=======
# WeatherApp
>>>>>>> d8babb87fc67c1f2f46845a7c634ef8d07e14268
