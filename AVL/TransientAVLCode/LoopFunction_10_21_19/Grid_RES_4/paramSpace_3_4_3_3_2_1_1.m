function [aeroForces] = paramSpace_3_4_3_3_2_1_1(sailStates,airStates)

	CL = (4.120978)*sailStates.alpha + (0.077075)*sailStates.beta + (-2.269758)*sailStates.p + (31.821777)*sailStates.q + (-0.351555)*sailStates.r + (0.010581)*sailStates.de;
	CD = -0.143890;
	CY = (0.033513)*sailStates.alpha + (-0.024863)*sailStates.beta + (-0.236456)*sailStates.p + (0.065300)*sailStates.q + (0.015500)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.055668)*sailStates.alpha + (0.139549)*sailStates.beta + (-0.931971)*sailStates.p + (6.929359)*sailStates.q + (-0.402891)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.690127)*sailStates.alpha + (-0.294232)*sailStates.beta + (7.964641)*sailStates.p + (-129.003830)*sailStates.q + (1.180526)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.279389)*sailStates.alpha + (-0.006199)*sailStates.beta + (0.584908)*sailStates.p + (-2.887066)*sailStates.q + (-0.007949)*sailStates.r + (-0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end