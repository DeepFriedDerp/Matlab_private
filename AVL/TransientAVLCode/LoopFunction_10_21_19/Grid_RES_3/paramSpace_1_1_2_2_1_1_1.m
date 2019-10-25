function [aeroForces] = paramSpace_1_1_2_2_1_1_1(sailStates,airStates)

	CL = (4.222528)*sailStates.alpha + (-0.331929)*sailStates.beta + (-2.183935)*sailStates.p + (34.806789)*sailStates.q + (-1.559806)*sailStates.r + (0.011055)*sailStates.de;
	CD = -0.364690;
	CY = (-0.049209)*sailStates.alpha + (-0.022243)*sailStates.beta + (-0.503665)*sailStates.p + (-1.027330)*sailStates.q + (-0.088810)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.035750)*sailStates.alpha + (0.203110)*sailStates.beta + (-0.922858)*sailStates.p + (8.103464)*sailStates.q + (-1.281397)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-12.135441)*sailStates.alpha + (1.258332)*sailStates.beta + (6.623743)*sailStates.p + (-124.672379)*sailStates.q + (5.221412)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (-0.253780)*sailStates.alpha + (0.050281)*sailStates.beta + (1.045565)*sailStates.p + (-3.519647)*sailStates.q + (-0.012891)*sailStates.r + (0.000210)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end