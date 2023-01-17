package springmvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.*;

@Controller
@RequestMapping("reservation")
public class ReservationController {

	// 訂位管理
	@RequestMapping("/read")
	public String read(@ModelAttribute("Reservation") Reservation Reservation, ModelMap model) {
		List<Reservation> reservationList = null;
		reservationList = ReservationDAO.readReservation();
		model.addAttribute("reservationList", reservationList);
		return "reservationManagement";
	}

	// 測試用
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseBody
	public List<Reservation> readTest(@ModelAttribute("Reservation") Reservation Reservation, ModelMap model) {
		List<Reservation> reservationList = null;
		reservationList = ReservationDAO.readReservation();
		model.addAttribute("reservationList", reservationList);
		return reservationList;
	}

	// 修改訂位(未使用)
	@RequestMapping("/update")
	public String update(@ModelAttribute("Reservation") Reservation Reservation, ModelMap model) {
		List<Reservation> ReservationList = null;
		ReservationList = ReservationDAO.updateReservation(Reservation);
		model.addAttribute("ReservationList", ReservationList);
		return "Res1";
	}

	// 刪除訂位
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, @ModelAttribute("Reservation") Reservation Reservation,
			ModelMap model) {
		List<Reservation> reservationList = null;
		reservationList = ReservationDAO.deleteReservation(id);
		model.addAttribute("reservationList", reservationList);
		return "toReservationManagement";
	}

	// 訂單頁面
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insert(@RequestBody Reservation reservation, ModelMap model) {
		String msg = ReservationDAO.addReservation(reservation);
		return msg;
	}

	// 查詢單筆訂位
	@RequestMapping(value = "/readOne/{reservationID}", method = RequestMethod.POST)
	@ResponseBody
	public Reservation readOneReservation(@PathVariable("reservationID") Integer reservationID) {
		Reservation reservation = ReservationDAO.readOneReservation(reservationID);
		return reservation;
	}
}
