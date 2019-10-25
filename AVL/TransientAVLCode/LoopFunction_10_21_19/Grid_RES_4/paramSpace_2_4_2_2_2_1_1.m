function [aeroForces] = paramSpace_2_4_2_2_2_1_1(sailStates,airStates)

	CL = (4.473723)*sailStates.alpha + (0.307853)*sailStates.beta + (-2.171151)*sailStates.p + (32.660076)*sailStates.q + (-1.291376)*sailStates.r + (0.010913)*sailStates.de;
	CD = -0.475530;
	CY = (0.077818)*sailStates.alpha + (-0.024904)*sailStates.beta + (-0.542941)*sailStates.p + (-0.100925)*sailStates.q + (-0.035583)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.074715)*sailStates.alpha + (0.354829)*sailStates.beta + (-0.829716)*sailStates.p + (6.378197)*sailStates.q + (-1.136511)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-13.770593)*sailStates.alpha + (-1.216907)*sailStates.beta + (7.121593)*sailStates.p + (-125.105080)*sailStates.q + (4.388672)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (-0.554659)*sailStates.alpha + (0.016556)*sailStates.beta + (1.173898)*sailStates.p + (-5.113641)*sailStates.q + (0.005966)*sailStates.r + (-0.000056)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end