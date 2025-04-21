import axios from "axios";

const API_URL = 'http://localhost/users';

export async function saveUser(user) {
    return await axios.post(API_URL, user);
}

export async function getUser(user) {
    return await axios.get(API_URL, user);
}