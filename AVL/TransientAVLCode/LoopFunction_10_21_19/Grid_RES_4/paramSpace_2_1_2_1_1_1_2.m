function [aeroForces] = paramSpace_2_1_2_1_1_1_2(sailStates,airStates)

	CL = (5.542413)*sailStates.alpha + (-0.536735)*sailStates.beta + (-2.622024)*sailStates.p + (37.276783)*sailStates.q + (-2.115098)*sailStates.r + (0.011393)*sailStates.de;
	CD = -1.824550;
	CY = (-0.219584)*sailStates.alpha + (-0.022800)*sailStates.beta + (-0.858667)*sailStates.p + (-1.693498)*sailStates.q + (-0.056220)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.217142)*sailStates.alpha + (0.354954)*sailStates.beta + (-1.276580)*sailStates.p + (10.989280)*sailStates.q + (-1.959745)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-12.310315)*sailStates.alpha + (2.142338)*sailStates.beta + (8.389076)*sailStates.p + (-136.946671)*sailStates.q + (7.202173)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.032438)*sailStates.alpha + (0.032762)*sailStates.beta + (1.904212)*sailStates.p + (-7.105729)*sailStates.q + (0.001695)*sailStates.r + (0.000324)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end