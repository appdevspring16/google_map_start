# Google Maps / Start

Welcome to the Start for Google Maps.
This project is used to demonstrate how to integrate a google map into your app.

The project already has a simple resource,  Place, that was generated with our starter gem, so the basic CRUD is in place.  The columns are as follows.

### Place Model
 - name: string
 - address: string
 - description: string
 - lat: float
 - lng: float
 - color: string

### Clone the repository and then first run in terminal:
- bundle install
- rake db:migrate

You now have the Place table, but it is empty.  You should use the CRUD to add a few places.
