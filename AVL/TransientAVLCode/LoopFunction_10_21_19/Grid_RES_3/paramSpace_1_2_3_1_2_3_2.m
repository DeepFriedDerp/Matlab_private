function [aeroForces] = paramSpace_1_2_3_1_2_3_2(sailStates,airStates)

	CL = (5.913298)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.351608)*sailStates.p + (28.124071)*sailStates.q + (1.375692)*sailStates.r + (0.009450)*sailStates.de;
	CD = -2.076980;
	CY = (-0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.857400)*sailStates.p + (0.000001)*sailStates.q + (0.151183)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.681239)*sailStates.alpha + (-0.428700)*sailStates.beta + (-1.127049)*sailStates.p + (8.021372)*sailStates.q + (1.513367)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-16.901854)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.638662)*sailStates.p + (-135.529190)*sailStates.q + (-4.534391)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.590053)*sailStates.alpha + (-0.075591)*sailStates.beta + (-2.105719)*sailStates.p + (9.977587)*sailStates.q + (-0.069726)*sailStates.r + (0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end