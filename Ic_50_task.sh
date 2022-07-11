


batch_size=128
job=perturbed_trans
seed=343
for split in rand_0 rand_1 rand_2 rand_3
do
for lr in 0.00005 #0.00002 0.0001  0.00005 
do
for dop in 0.2
do
exp_id=0709_${job}_emb_${split}_bs_${batch_size}_dop_${dop}_lr_${lr}_sd_${seed}
python transPro_Ic50_ft.py \
--exp_id ${exp_id} --dop ${dop} --seed ${seed} --batch_size ${batch_size} \
--device 1  --max_epochs 1000 --lr ${lr} --job ${job} \
--Ic_50_train_dir "/raid/home/yoyowu/PertPro/perturbed_proteomics/data/Ic50_e2e/${split}_train_ic50_wo_na.csv" \
--Ic_50_dev_dir "/raid/home/yoyowu/PertPro/perturbed_proteomics/data/Ic50_e2e/${split}_dev_ic50_wo_na.csv" \
--Ic_50_test_dir "/raid/home/yoyowu/PertPro/perturbed_proteomics/data/Ic50_e2e/rand_0123_test_ic50_wo_na.csv" \
--drug_file_dir "/raid/home/yoyowu/PertPro/perturbed_proteomics/data/a_gdsc_drugs_smiles_pro.csv" \
--trans_basal_dir "/raid/home/yoyowu/PertPro/perturbed_proteomics/data/Combat_batch_removal/fixed_adjusted_ccle_tcga_basal_trans.csv" \
>June_logs/${exp_id}.log 2>&1 &
done
done
done