package co.grandcircus.hotelDB.entity;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class ReviewDao {

	@PersistenceContext
	private EntityManager em;
	
	public List<Review> findById(Long id) {
		String hql = "FROM Review WHERE hotel_id = :hotel";
		
		return em.createQuery(hql, Review.class).setParameter("hotel", id).getResultList();
	}
	
	public void createReview(Review review) {
		em.persist(review);
	}
	
	
}
