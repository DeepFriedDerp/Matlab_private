function [aeroForces] = paramSpace_3_1_3_2_1_2_2(sailStates,airStates)

	CL = (4.045226)*sailStates.alpha + (0.107714)*sailStates.beta + (-2.539261)*sailStates.p + (34.753586)*sailStates.q + (0.536297)*sailStates.r + (0.010857)*sailStates.de;
	CD = 0.013960;
	CY = (-0.096224)*sailStates.alpha + (-0.025688)*sailStates.beta + (0.206859)*sailStates.p + (-0.769435)*sailStates.q + (-0.013585)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.360309)*sailStates.alpha + (-0.036166)*sailStates.beta + (-1.242810)*sailStates.p + (10.330219)*sailStates.q + (0.406247)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.492235)*sailStates.alpha + (-0.413955)*sailStates.beta + (8.600011)*sailStates.p + (-135.788696)*sailStates.q + (-1.817744)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.072966)*sailStates.alpha + (0.005511)*sailStates.beta + (-0.364236)*sailStates.p + (1.924302)*sailStates.q + (0.002596)*sailStates.r + (0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end