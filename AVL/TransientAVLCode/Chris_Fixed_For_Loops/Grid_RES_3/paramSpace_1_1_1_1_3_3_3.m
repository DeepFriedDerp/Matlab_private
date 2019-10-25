function [aeroForces] = paramSpace_1_1_1_1_3_3_3(sailStates,airStates)

	CL = (-3.036085)*sailStates.alpha + (0.183858)*sailStates.beta + (-7.634218)*sailStates.p + (68.642990)*sailStates.q + (0.952673)*sailStates.r + (0.011865)*sailStates.de;
	CD = -5.353560;
	CY = (2.611322)*sailStates.alpha + (-0.030798)*sailStates.beta + (0.913019)*sailStates.p + (4.214559)*sailStates.q + (0.160589)*sailStates.r + (0.000985)*sailStates.de;

	Cl = (-5.394236)*sailStates.alpha + (-0.624971)*sailStates.beta + (-5.541633)*sailStates.p + (49.309906)*sailStates.q + (1.305812)*sailStates.r + (0.008255)*sailStates.de;
	Cm = (28.250015)*sailStates.alpha + (-0.749691)*sailStates.beta + (28.041418)*sailStates.p + (-285.712006)*sailStates.q + (-3.011247)*sailStates.r + (-0.091390)*sailStates.de;
	Cn = (-11.387889)*sailStates.alpha + (-0.120362)*sailStates.beta + (-3.175870)*sailStates.p + (15.722754)*sailStates.q + (-0.156967)*sailStates.r + (-0.000689)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end