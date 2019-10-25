function [aeroForces] = paramSpace_1_3_2_3_3_2_3(sailStates,airStates)

	CL = (3.901357)*sailStates.alpha + (0.188999)*sailStates.beta + (-2.725731)*sailStates.p + (37.206364)*sailStates.q + (-1.091089)*sailStates.r + (0.010728)*sailStates.de;
	CD = 0.045090;
	CY = (0.051558)*sailStates.alpha + (-0.023155)*sailStates.beta + (-0.303082)*sailStates.p + (0.665000)*sailStates.q + (-0.053441)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.287193)*sailStates.alpha + (0.187990)*sailStates.beta + (-1.323710)*sailStates.p + (11.293183)*sailStates.q + (-0.770246)*sailStates.r + (0.000521)*sailStates.de;
	Cm = (-13.692027)*sailStates.alpha + (-0.674475)*sailStates.beta + (8.933681)*sailStates.p + (-141.044128)*sailStates.q + (3.656088)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.115157)*sailStates.alpha + (0.022406)*sailStates.beta + (0.464783)*sailStates.p + (-1.859193)*sailStates.q + (-0.012706)*sailStates.r + (-0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end