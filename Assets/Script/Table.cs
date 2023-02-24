using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Table : MonoBehaviour
{
   public bool checkTarget;
    private void Awake()
    {
        checkTarget = false;
    }
    private void Update()
    {
        
    }
    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag("BossAI"))
        {
            checkTarget = true;
            GameManager.instance.AttackAIJumpTable();
        }    
    }

}
