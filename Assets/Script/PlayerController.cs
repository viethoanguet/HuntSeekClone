using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class PlayerController : MonoBehaviour
{

    public bool checkBoss;
    public bool isDead;
  
    private void Start()
    {
        checkBoss = false;
        isDead = false;

    }
    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Arrow"))
        {
            gameObject.transform.DOScale(new Vector3(1, 1, 1), 1f);
            checkBoss = true;
        }    
    }
    private void OnCollisionEnter(Collision collision)
    {
       /* if(collision.gameObject.CompareTag("AIPlayer"))
        {
            GameManager.instance.countAI--;
            
        }*/
    }
}
