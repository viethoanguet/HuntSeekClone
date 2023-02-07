using DG.Tweening;
using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;


public class LoadingController : MonoBehaviour
{
    public const string LOADING = "Loading {0}%";
    [SerializeField] private TextMeshProUGUI txtPercent;
    [SerializeField] private Image imgLoadingIndex;
    private float _percentValue = 0;
    private float _timeLoadingMin = 5f;
    public void Awake()
    {
        txtPercent.text = string.Format(LOADING, _percentValue);
        Loading();
    }

    private void Loading()
    {
        DOTween.To(x => _percentValue = (int)x, 0, 99, _timeLoadingMin).SetEase(Ease.OutQuad).OnUpdate(() =>
        {
            txtPercent.text = string.Format(LOADING, _percentValue);
            imgLoadingIndex.fillAmount = _percentValue / 100;
        });

        DOTween.To(x => _percentValue = (int)x, 0, 100, _timeLoadingMin).OnComplete(() =>
        {
            txtPercent.text = string.Format(LOADING, 100);
            imgLoadingIndex.fillAmount = 1;
            ShowMenuGame();
        });

    }

    private void ShowMenuGame()
    {
        SceneManager.LoadScene(1);
    }
}


