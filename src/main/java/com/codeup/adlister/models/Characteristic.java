package com.codeup.adlister.models;

public class Characteristic {
        private long id;
        private String characteristic;

        public Characteristic(long id, String characteristic) {
            this.id = id;
            this.characteristic = characteristic;
        }

//        public Ad(long user_id, String title, String description, String zipCode, String dob, String gender, String pictureURL, String species) {
//            this.user_id = user_id;
//            this.title = title;
//            this.description = description;
//            this.zipCode = zipCode;
//            this.dob = dob;
//            this.gender = gender;
//            this.pictureURL = pictureURL;
//            this.species = species;
//        }

//        public Ad(long userId, String title, String description) {
//            this.user_id = userId;
//            this.title = title;
//            this.description = description;
//        }


        public String getCharacteristic() {
            return characteristic;
        }

        public void setCharacteristic(String characteristic) {
            this.characteristic = characteristic;
        }

        public Characteristic(long id) {
            this.id = id;
        }

        public long getId() {
            return id;
        }

        public void setId(long id) {
            this.id = id;
        }
        
}
