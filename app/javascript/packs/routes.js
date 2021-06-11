import Home from '../components/Home'
import RoomDetail from '../components/room/RoomDetail'

export const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/rooms/:id',
    name: 'RoomDetail',
    component: RoomDetail
  }
]
