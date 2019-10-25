function [aeroForces] = paramSpace_1_2_2_1_3_3_2(sailStates,airStates)

	CL = (5.159239)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.306710)*sailStates.p + (28.427094)*sailStates.q + (0.934558)*sailStates.r + (0.009338)*sailStates.de;
	CD = -1.565910;
	CY = (0.187285)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.571260)*sailStates.p + (1.671347)*sailStates.q + (0.100729)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (1.120701)*sailStates.alpha + (-0.352299)*sailStates.beta + (-1.099185)*sailStates.p + (8.101538)*sailStates.q + (1.129334)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-15.557163)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.117644)*sailStates.p + (-133.415192)*sailStates.q + (-3.068985)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (0.298028)*sailStates.alpha + (-0.062120)*sailStates.beta + (-1.517536)*sailStates.p + (6.171663)*sailStates.q + (-0.034276)*sailStates.r + (-0.000345)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end