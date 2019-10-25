function [aeroForces] = paramSpace_6_1_1_2_1_1_1(sailStates,airStates)

	CL = (4.135435)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.372656)*sailStates.p + (33.960861)*sailStates.q + (-0.768880)*sailStates.r + (0.011043)*sailStates.de;
	CD = -0.082810;
	CY = (-0.034041)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.281325)*sailStates.p + (-0.466416)*sailStates.q + (-0.019623)*sailStates.r + (-0.000100)*sailStates.de;

	Cl = (1.141020)*sailStates.alpha + (0.159507)*sailStates.beta + (-1.040926)*sailStates.p + (8.349903)*sailStates.q + (-0.670430)*sailStates.r + (0.000073)*sailStates.de;
	Cm = (-14.224994)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.958861)*sailStates.p + (-131.613632)*sailStates.q + (2.641852)*sailStates.r + (-0.069591)*sailStates.de;
	Cn = (-0.087410)*sailStates.alpha + (0.011154)*sailStates.beta + (0.568789)*sailStates.p + (-1.918589)*sailStates.q + (-0.002385)*sailStates.r + (0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end