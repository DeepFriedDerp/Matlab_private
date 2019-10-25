function [aeroForces] = paramSpace_3_1_1_1_3_2_1(sailStates,airStates)

	CL = (3.818427)*sailStates.alpha + (-0.039834)*sailStates.beta + (-1.679716)*sailStates.p + (27.417233)*sailStates.q + (-0.238509)*sailStates.r + (0.010529)*sailStates.de;
	CD = -0.018540;
	CY = (0.327967)*sailStates.alpha + (-0.023349)*sailStates.beta + (-0.256603)*sailStates.p + (1.915493)*sailStates.q + (0.016616)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (0.781314)*sailStates.alpha + (0.033192)*sailStates.beta + (-0.535737)*sailStates.p + (3.579259)*sailStates.q + (-0.260623)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-14.037134)*sailStates.alpha + (0.213387)*sailStates.beta + (5.935087)*sailStates.p + (-112.650780)*sailStates.q + (0.806395)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-0.598423)*sailStates.alpha + (-0.005185)*sailStates.beta + (0.523089)*sailStates.p + (-3.688445)*sailStates.q + (-0.014871)*sailStates.r + (-0.000572)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end