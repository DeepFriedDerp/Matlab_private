function [aeroForces] = paramSpace_1_1_1_1_1_3_1(sailStates,airStates)

	CL = (6.442242)*sailStates.alpha + (0.368949)*sailStates.beta + (-1.517634)*sailStates.p + (20.513552)*sailStates.q + (2.096895)*sailStates.r + (0.008744)*sailStates.de;
	CD = -2.634350;
	CY = (-0.669383)*sailStates.alpha + (-0.018576)*sailStates.beta + (1.180915)*sailStates.p + (-2.260753)*sailStates.q + (0.208442)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (1.963441)*sailStates.alpha + (-0.367266)*sailStates.beta + (-0.483151)*sailStates.p + (1.682896)*sailStates.q + (2.050884)*sailStates.r + (-0.000571)*sailStates.de;
	Cm = (-17.774605)*sailStates.alpha + (-1.346100)*sailStates.beta + (7.271311)*sailStates.p + (-112.748634)*sailStates.q + (-6.852155)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (2.536709)*sailStates.alpha + (-0.103859)*sailStates.beta + (-2.687435)*sailStates.p + (13.990890)*sailStates.q + (-0.097656)*sailStates.r + (0.000835)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end