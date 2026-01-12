# Devise Auth Blog

A Ruby on Rails application demonstrating user authentication with Devise and blog management functionality.

## Features

- User authentication (sign up, sign in, sign out) using Devise
- Blog post management (CRUD operations)
- User-specific blog posts
- Docker support for containerized deployment

## Prerequisites

- Ruby 3.3.1
- Rails 7.1.5+
- PostgreSQL 12+
- Node.js (for asset compilation)

## Tech Stack

- **Ruby on Rails** 7.1.5
- **Devise** - User authentication
- **PostgreSQL** - Database
- **Hotwire** (Turbo & Stimulus) - Modern JavaScript framework
- **Tailwind CSS** or Bootstrap (if configured)
- **Docker** - Containerization support

## Getting Started

### Local Development Setup

1. **Clone the repository**
   ```bash
   git clone git@github.com-GurzuInc:George-Maharjan/devise_auth.git
   cd devise_auth
   ```

2. **Install PostgreSQL**

   macOS (using Homebrew):
   ```bash
   brew install postgresql@14
   brew services start postgresql@14
   ```

   Ubuntu/Debian:
   ```bash
   sudo apt-get install postgresql postgresql-contrib libpq-dev
   sudo service postgresql start
   ```

3. **Install Ruby dependencies**
   ```bash
   bundle install
   ```

4. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # Optional: if you have seed data
   ```

5. **Start the Rails server**
   ```bash
   rails server
   ```

6. **Visit the application**
   Open your browser and navigate to `http://localhost:3000`

### Docker Setup

1. **Build the Docker image**
   ```bash
   docker build -t devise_auth .
   ```

2. **Run the container**
   ```bash
   docker run -p 3000:3000 devise_auth
   ```

## Configuration

### Devise Configuration

Devise is configured for User authentication. Key configuration files:
- `config/initializers/devise.rb` - Devise settings
- `config/routes.rb` - Authentication routes

### Database

This application uses PostgreSQL for all environments.

Database configuration: `config/database.yml`

**Database names:**
- Development: `devise_auth_development`
- Test: `devise_auth_test`
- Production: `devise_auth_production`

For production, set the `DEVISE_AUTH_DATABASE_PASSWORD` environment variable.

## Application Structure

- **Models**: User (Devise), Blog
- **Controllers**: BlogsController, ApplicationController
- **Routes**:
  - Devise routes for authentication (`/users/sign_in`, `/users/sign_up`, etc.)
  - Blog CRUD routes (`/blogs`)
  - Root path: Blogs index

## Running Tests

```bash
# Run all tests
rails test

# Run system tests
rails test:system
```

## Deployment

### Heroku

```bash
heroku create
git push heroku main
heroku run rails db:migrate
```

### Docker Production

The Dockerfile is production-ready. Configure your environment variables and deploy to your preferred container platform.

## Environment Variables

Create a `.env` file or set the following environment variables:

```bash
RAILS_MASTER_KEY=<your_master_key>
DEVISE_AUTH_DATABASE_PASSWORD=<your_database_password>  # For production
# Or use DATABASE_URL for full connection string
# DATABASE_URL=postgresql://username:password@localhost/devise_auth_production
```

## Common Tasks

### Create a new user (Console)
```bash
rails console
User.create(email: 'user@example.com', password: 'password')
```

### Reset database
```bash
rails db:reset
```

### View routes
```bash
rails routes
```

## Troubleshooting

- **Bundle install fails**: Ensure you have the correct Ruby version installed (`ruby -v`)
- **Database errors**: Run `rails db:reset` to recreate the database
- **Port already in use**: Change the port with `rails s -p 3001`

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is part of a bootcamp training exercise.

## Contact

For questions or support, please open an issue in the repository.
