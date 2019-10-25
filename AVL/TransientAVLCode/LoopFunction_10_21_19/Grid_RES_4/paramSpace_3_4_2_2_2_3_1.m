function [aeroForces] = paramSpace_3_4_2_2_2_3_1(sailStates,airStates)

	CL = (4.474385)*sailStates.alpha + (-0.286475)*sailStates.beta + (-2.171359)*sailStates.p + (32.643738)*sailStates.q + (1.283290)*sailStates.r + (0.010943)*sailStates.de;
	CD = -0.466750;
	CY = (-0.075354)*sailStates.alpha + (-0.024883)*sailStates.beta + (0.528190)*sailStates.p + (0.100922)*sailStates.q + (-0.034623)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (1.074065)*sailStates.alpha + (-0.347491)*sailStates.beta + (-0.829821)*sailStates.p + (6.377438)*sailStates.q + (1.113129)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-13.838388)*sailStates.alpha + (1.081743)*sailStates.beta + (7.124624)*sailStates.p + (-125.105080)*sailStates.q + (-4.342433)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.547481)*sailStates.alpha + (0.016144)*sailStates.beta + (-1.152107)*sailStates.p + (5.102057)*sailStates.q + (0.006108)*sailStates.r + (0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end