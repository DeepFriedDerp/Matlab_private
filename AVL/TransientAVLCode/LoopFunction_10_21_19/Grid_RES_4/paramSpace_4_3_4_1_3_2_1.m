function [aeroForces] = paramSpace_4_3_4_1_3_2_1(sailStates,airStates)

	CL = (3.573202)*sailStates.alpha + (-0.043279)*sailStates.beta + (-1.676328)*sailStates.p + (27.815220)*sailStates.q + (0.228219)*sailStates.r + (0.010125)*sailStates.de;
	CD = 0.055310;
	CY = (0.325489)*sailStates.alpha + (-0.027693)*sailStates.beta + (-0.126613)*sailStates.p + (2.326709)*sailStates.q + (0.025435)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (0.566603)*sailStates.alpha + (-0.029804)*sailStates.beta + (-0.477949)*sailStates.p + (2.887953)*sailStates.q + (0.077806)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-13.162739)*sailStates.alpha + (0.194837)*sailStates.beta + (5.977035)*sailStates.p + (-113.341965)*sailStates.q + (-0.859927)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-0.450153)*sailStates.alpha + (0.009096)*sailStates.beta + (0.294528)*sailStates.p + (-3.223353)*sailStates.q + (-0.055787)*sailStates.r + (-0.000691)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end