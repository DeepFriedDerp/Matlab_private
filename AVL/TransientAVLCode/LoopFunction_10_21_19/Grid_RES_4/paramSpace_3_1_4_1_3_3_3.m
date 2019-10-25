function [aeroForces] = paramSpace_3_1_4_1_3_3_3(sailStates,airStates)

	CL = (5.171556)*sailStates.alpha + (0.574889)*sailStates.beta + (-3.506351)*sailStates.p + (44.461445)*sailStates.q + (2.242056)*sailStates.r + (0.011829)*sailStates.de;
	CD = -1.855780;
	CY = (0.525388)*sailStates.alpha + (-0.022750)*sailStates.beta + (0.909786)*sailStates.p + (1.471503)*sailStates.q + (-0.059475)*sailStates.r + (0.000320)*sailStates.de;

	Cl = (1.286890)*sailStates.alpha + (-0.357940)*sailStates.beta + (-1.999122)*sailStates.p + (17.696421)*sailStates.q + (2.079573)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-11.065222)*sailStates.alpha + (-2.336330)*sailStates.beta + (11.338323)*sailStates.p + (-161.242615)*sailStates.q + (-7.654625)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (-1.480204)*sailStates.alpha + (0.033243)*sailStates.beta + (-1.952973)*sailStates.p + (7.176072)*sailStates.q + (-0.000320)*sailStates.r + (-0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end