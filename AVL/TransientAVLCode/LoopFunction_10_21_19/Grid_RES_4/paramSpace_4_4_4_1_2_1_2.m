function [aeroForces] = paramSpace_4_4_4_1_2_1_2(sailStates,airStates)

	CL = (5.572680)*sailStates.alpha + (0.289119)*sailStates.beta + (-2.290320)*sailStates.p + (27.153833)*sailStates.q + (-1.260990)*sailStates.r + (0.008785)*sailStates.de;
	CD = -1.928050;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.790494)*sailStates.p + (-0.000001)*sailStates.q + (0.157239)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.542497)*sailStates.alpha + (0.476550)*sailStates.beta + (-1.052763)*sailStates.p + (7.146547)*sailStates.q + (-1.390828)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-16.202532)*sailStates.alpha + (-1.065183)*sailStates.beta + (9.567389)*sailStates.p + (-133.820877)*sailStates.q + (4.041377)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.642205)*sailStates.alpha + (-0.064805)*sailStates.beta + (2.000188)*sailStates.p + (-9.717973)*sailStates.q + (-0.079725)*sailStates.r + (-0.000184)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end