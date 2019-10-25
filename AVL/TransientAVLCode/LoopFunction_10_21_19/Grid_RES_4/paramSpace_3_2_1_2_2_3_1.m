function [aeroForces] = paramSpace_3_2_1_2_2_3_1(sailStates,airStates)

	CL = (4.530447)*sailStates.alpha + (0.088645)*sailStates.beta + (-2.191106)*sailStates.p + (32.893337)*sailStates.q + (1.277609)*sailStates.r + (0.011141)*sailStates.de;
	CD = -0.451190;
	CY = (-0.072862)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.513844)*sailStates.p + (0.100923)*sailStates.q + (-0.033690)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.199042)*sailStates.alpha + (-0.233235)*sailStates.beta + (-0.904300)*sailStates.p + (7.257374)*sailStates.q + (1.095385)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-14.127421)*sailStates.alpha + (-0.316447)*sailStates.beta + (7.194335)*sailStates.p + (-126.149185)*sailStates.q + (-4.304220)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.488715)*sailStates.alpha + (0.017471)*sailStates.beta + (-1.126582)*sailStates.p + (5.039263)*sailStates.q + (0.005713)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end