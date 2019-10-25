function [aeroForces] = paramSpace_1_2_3_3_2_3_2(sailStates,airStates)

	CL = (4.067367)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.458953)*sailStates.p + (33.111111)*sailStates.q + (-0.209903)*sailStates.r + (0.010443)*sailStates.de;
	CD = -0.103160;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.125443)*sailStates.p + (-0.000000)*sailStates.q + (0.022119)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.229924)*sailStates.alpha + (-0.062722)*sailStates.beta + (-1.160994)*sailStates.p + (9.338051)*sailStates.q + (0.039704)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-14.987668)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.712850)*sailStates.p + (-135.529190)*sailStates.q + (0.716154)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.224958)*sailStates.alpha + (-0.011060)*sailStates.beta + (-0.445539)*sailStates.p + (2.510326)*sailStates.q + (-0.035721)*sailStates.r + (0.000022)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end