function [aeroForces] = paramSpace_1_2_2_2_2_2_3(sailStates,airStates)

	CL = (3.772463)*sailStates.alpha + (-0.079422)*sailStates.beta + (-2.867176)*sailStates.p + (38.609215)*sailStates.q + (-1.146842)*sailStates.r + (0.010788)*sailStates.de;
	CD = 0.083390;
	CY = (-0.009214)*sailStates.alpha + (-0.025307)*sailStates.beta + (-0.276803)*sailStates.p + (0.301043)*sailStates.q + (-0.055070)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.339247)*sailStates.alpha + (0.099692)*sailStates.beta + (-1.496687)*sailStates.p + (13.169190)*sailStates.q + (-0.820030)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-13.324165)*sailStates.alpha + (0.293986)*sailStates.beta + (9.417440)*sailStates.p + (-145.703583)*sailStates.q + (3.858687)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.295463)*sailStates.alpha + (0.023833)*sailStates.beta + (0.352863)*sailStates.p + (-0.725790)*sailStates.q + (-0.033719)*sailStates.r + (-0.000114)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end