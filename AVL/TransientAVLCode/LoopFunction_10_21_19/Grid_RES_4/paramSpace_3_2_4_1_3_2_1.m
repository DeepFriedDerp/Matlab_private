function [aeroForces] = paramSpace_3_2_4_1_3_2_1(sailStates,airStates)

	CL = (3.832482)*sailStates.alpha + (0.008045)*sailStates.beta + (-1.698761)*sailStates.p + (27.732180)*sailStates.q + (-0.213874)*sailStates.r + (0.010604)*sailStates.de;
	CD = -0.003370;
	CY = (0.313302)*sailStates.alpha + (-0.024090)*sailStates.beta + (-0.211945)*sailStates.p + (1.915493)*sailStates.q + (0.014094)*sailStates.r + (0.000407)*sailStates.de;

	Cl = (0.711583)*sailStates.alpha + (0.022292)*sailStates.beta + (-0.512123)*sailStates.p + (3.253706)*sailStates.q + (-0.191618)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-14.033237)*sailStates.alpha + (-0.064122)*sailStates.beta + (5.993484)*sailStates.p + (-113.694908)*sailStates.q + (0.671959)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (-0.555087)*sailStates.alpha + (-0.003041)*sailStates.beta + (0.455067)*sailStates.p + (-3.625102)*sailStates.q + (-0.015628)*sailStates.r + (-0.000589)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end