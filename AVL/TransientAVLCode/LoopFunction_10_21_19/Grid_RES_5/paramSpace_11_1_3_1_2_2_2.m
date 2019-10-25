function [aeroForces] = paramSpace_11_1_3_1_2_2_2(sailStates,airStates)

	CL = (4.441670)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.127245)*sailStates.p + (41.587975)*sailStates.q + (1.675910)*sailStates.r + (0.011714)*sailStates.de;
	CD = -0.614320;
	CY = (0.230466)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.607698)*sailStates.p + (0.768920)*sailStates.q + (-0.063844)*sailStates.r + (0.000167)*sailStates.de;

	Cl = (1.338027)*sailStates.alpha + (-0.334822)*sailStates.beta + (-1.640983)*sailStates.p + (14.311999)*sailStates.q + (1.457788)*sailStates.r + (0.001054)*sailStates.de;
	Cm = (-12.748845)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.051119)*sailStates.p + (-151.567520)*sailStates.q + (-5.676173)*sailStates.r + (-0.071297)*sailStates.de;
	Cn = (-0.569291)*sailStates.alpha + (0.035191)*sailStates.beta + (-1.233601)*sailStates.p + (4.395656)*sailStates.q + (-0.005524)*sailStates.r + (-0.000107)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end