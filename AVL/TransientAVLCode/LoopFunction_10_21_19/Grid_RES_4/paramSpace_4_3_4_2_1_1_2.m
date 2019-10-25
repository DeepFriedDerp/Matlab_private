function [aeroForces] = paramSpace_4_3_4_2_1_1_2(sailStates,airStates)

	CL = (3.985142)*sailStates.alpha + (-0.008529)*sailStates.beta + (-2.379636)*sailStates.p + (31.877201)*sailStates.q + (0.169628)*sailStates.r + (0.009786)*sailStates.de;
	CD = -0.180320;
	CY = (-0.090523)*sailStates.alpha + (-0.024093)*sailStates.beta + (-0.105163)*sailStates.p + (-0.756269)*sailStates.q + (0.020837)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.160380)*sailStates.alpha + (0.079211)*sailStates.beta + (-1.108490)*sailStates.p + (8.799986)*sailStates.q + (-0.080206)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-14.547197)*sailStates.alpha + (0.040461)*sailStates.beta + (8.566811)*sailStates.p + (-133.768066)*sailStates.q + (-0.650006)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (-0.180541)*sailStates.alpha + (-0.015050)*sailStates.beta + (0.468586)*sailStates.p + (-2.323560)*sailStates.q + (-0.033498)*sailStates.r + (0.000155)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end