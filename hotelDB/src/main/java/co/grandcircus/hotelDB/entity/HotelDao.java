package co.grandcircus.hotelDB.entity;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class HotelDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public List<Hotel> findByName(String city){
		
		String hql = "FROM Hotel WHERE city = :city ORDER BY price";
		
		return em.createQuery(hql, Hotel.class).setParameter("city", city).getResultList();
	}

}
