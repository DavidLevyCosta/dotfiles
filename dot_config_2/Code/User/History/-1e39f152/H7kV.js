import axios from "axios";

const API_URL = 'http://localhost:8080/users';

export async function saveUser(user) {
    return await axios.post(API_URL, user);
}

export async function getUser(id) {
    return await axios.get(`${API_URL}/${id}`);
}