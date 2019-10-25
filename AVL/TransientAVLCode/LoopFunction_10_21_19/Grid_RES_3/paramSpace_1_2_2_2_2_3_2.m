function [aeroForces] = paramSpace_1_2_2_2_2_3_2(sailStates,airStates)

	CL = (4.229532)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.433716)*sailStates.p + (32.035961)*sailStates.q + (0.138981)*sailStates.r + (0.010112)*sailStates.de;
	CD = -0.327440;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.272293)*sailStates.p + (-0.000000)*sailStates.q + (0.048013)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.278157)*sailStates.alpha + (-0.136147)*sailStates.beta + (-1.152853)*sailStates.p + (9.041534)*sailStates.q + (0.342995)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-15.181480)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.911611)*sailStates.p + (-135.529190)*sailStates.q + (-0.411076)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.299984)*sailStates.alpha + (-0.024006)*sailStates.beta + (-0.793608)*sailStates.p + (4.191954)*sailStates.q + (-0.043612)*sailStates.r + (0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end