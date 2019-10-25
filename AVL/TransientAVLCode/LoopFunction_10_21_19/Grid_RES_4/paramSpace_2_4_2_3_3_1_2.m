function [aeroForces] = paramSpace_2_4_2_3_3_1_2(sailStates,airStates)

	CL = (4.345444)*sailStates.alpha + (0.250064)*sailStates.beta + (-2.559016)*sailStates.p + (35.519485)*sailStates.q + (-1.117959)*sailStates.r + (0.011014)*sailStates.de;
	CD = -0.248280;
	CY = (0.063229)*sailStates.alpha + (-0.024202)*sailStates.beta + (-0.471329)*sailStates.p + (0.498141)*sailStates.q + (-0.030910)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.327986)*sailStates.alpha + (0.285772)*sailStates.beta + (-1.152202)*sailStates.p + (9.323083)*sailStates.q + (-0.952421)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.280951)*sailStates.alpha + (-0.977328)*sailStates.beta + (8.486190)*sailStates.p + (-135.916275)*sailStates.q + (3.792941)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.187946)*sailStates.alpha + (0.012499)*sailStates.beta + (0.972899)*sailStates.p + (-4.539861)*sailStates.q + (0.006279)*sailStates.r + (-0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end