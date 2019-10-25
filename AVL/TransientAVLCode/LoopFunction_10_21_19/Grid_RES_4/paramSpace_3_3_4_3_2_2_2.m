function [aeroForces] = paramSpace_3_3_4_3_2_2_2(sailStates,airStates)

	CL = (4.029555)*sailStates.alpha + (-0.034074)*sailStates.beta + (-2.566294)*sailStates.p + (34.993881)*sailStates.q + (0.346608)*sailStates.r + (0.010995)*sailStates.de;
	CD = 0.043980;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.098070)*sailStates.p + (0.000000)*sailStates.q + (-0.006428)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.230066)*sailStates.alpha + (-0.056434)*sailStates.beta + (-1.191534)*sailStates.p + (9.585802)*sailStates.q + (0.263539)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-14.587755)*sailStates.alpha + (0.153274)*sailStates.beta + (8.751653)*sailStates.p + (-137.194580)*sailStates.q + (-1.206269)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.039474)*sailStates.alpha + (0.003349)*sailStates.beta + (-0.136051)*sailStates.p + (0.262836)*sailStates.q + (-0.003511)*sailStates.r + (-0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end