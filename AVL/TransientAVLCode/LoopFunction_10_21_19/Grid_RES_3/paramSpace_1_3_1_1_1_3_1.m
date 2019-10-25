function [aeroForces] = paramSpace_1_3_1_1_1_3_1(sailStates,airStates)

	CL = (6.442243)*sailStates.alpha + (-0.368949)*sailStates.beta + (-1.517634)*sailStates.p + (20.513550)*sailStates.q + (2.096895)*sailStates.r + (0.008744)*sailStates.de;
	CD = -2.634350;
	CY = (-0.669383)*sailStates.alpha + (-0.031086)*sailStates.beta + (1.180915)*sailStates.p + (-2.260753)*sailStates.q + (0.208442)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (1.785460)*sailStates.alpha + (-0.629494)*sailStates.beta + (-0.398533)*sailStates.p + (0.622029)*sailStates.q + (2.065904)*sailStates.r + (-0.000796)*sailStates.de;
	Cm = (-17.774607)*sailStates.alpha + (1.346100)*sailStates.beta + (7.271311)*sailStates.p + (-112.748650)*sailStates.q + (-6.852156)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (2.625100)*sailStates.alpha + (-0.071896)*sailStates.beta + (-2.672515)*sailStates.p + (13.803829)*sailStates.q + (-0.095008)*sailStates.r + (0.000835)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end