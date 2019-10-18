function [aeroForces] = paramSpace_2_1_2_2_2_1_2(sailStates,airStates)

	CL = (6.020430)*sailStates.alpha + (-2.033122)*sailStates.beta + (-3.716037)*sailStates.p + (51.082932)*sailStates.q + (2.313951)*sailStates.r + (0.012781)*sailStates.de;
	CD = -6.133180;
	CY = (1.993986)*sailStates.alpha + (-0.134813)*sailStates.beta + (0.341179)*sailStates.p + (15.508899)*sailStates.q + (-0.037228)*sailStates.r + (0.003285)*sailStates.de;

	Cl = (-5.278440)*sailStates.alpha + (-1.078869)*sailStates.beta + (-1.889313)*sailStates.p + (16.402473)*sailStates.q + (2.534324)*sailStates.r + (0.001645)*sailStates.de;
	Cm = (3.778799)*sailStates.alpha + (9.098867)*sailStates.beta + (11.597346)*sailStates.p + (-165.298080)*sailStates.q + (-8.166588)*sailStates.r + (-0.068331)*sailStates.de;
	Cn = (-2.279503)*sailStates.alpha + (0.227179)*sailStates.beta + (-0.955380)*sailStates.p + (-8.632940)*sailStates.q + (-0.193891)*sailStates.r + (-0.004287)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end