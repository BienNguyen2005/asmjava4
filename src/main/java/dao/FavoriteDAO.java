package dao;

import java.util.List;

import entity.Favorite;
import entity.Video;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import utils.XJPA;

public class FavoriteDAO implements DAOInterface<Favorite, Integer> {
	EntityManager em = XJPA.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public List<Favorite> findAll() {
		String jpql = "SELECT o FROM Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		return query.getResultList();
	}

	@Override
	public Favorite findById(Integer id) {
		return em.find(Favorite.class, id);
	}

	@Override
	public void create(Favorite t) {
		try {
			em.getTransaction().begin();
			em.persist(t);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public boolean deleteById(Integer id) {
		Favorite entity = em.find(Favorite.class, id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return false;
		}
	}

	@Override
	public void update(Favorite t) {
		try {
			em.getTransaction().begin();
			em.merge(t);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	public List<Video> findTop10MostFavoritedVideos() {
		String jpql = "SELECT f.video FROM Favorite f GROUP BY f.video ORDER BY COUNT(f) DESC";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setMaxResults(10);
		return query.getResultList();
	}

	public List<Video> findVideosWithNoFavorites() {
		String jpql = "SELECT v FROM Video v LEFT JOIN Favorite f ON v.id = f.video.id WHERE f.id IS NULL";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		return query.getResultList();
	}
}
