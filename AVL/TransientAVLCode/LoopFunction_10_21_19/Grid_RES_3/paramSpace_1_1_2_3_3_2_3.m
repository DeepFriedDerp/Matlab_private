function [aeroForces] = paramSpace_1_1_2_3_3_2_3(sailStates,airStates)

	CL = (3.901357)*sailStates.alpha + (-0.188999)*sailStates.beta + (-2.725731)*sailStates.p + (37.206364)*sailStates.q + (-1.091089)*sailStates.r + (0.010728)*sailStates.de;
	CD = 0.045090;
	CY = (0.051558)*sailStates.alpha + (-0.026506)*sailStates.beta + (-0.303082)*sailStates.p + (0.665000)*sailStates.q + (-0.053441)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.403459)*sailStates.alpha + (0.057675)*sailStates.beta + (-1.408345)*sailStates.p + (12.354052)*sailStates.q + (-0.785169)*sailStates.r + (0.000750)*sailStates.de;
	Cm = (-13.692028)*sailStates.alpha + (0.674475)*sailStates.beta + (8.933681)*sailStates.p + (-141.044128)*sailStates.q + (3.656088)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.165587)*sailStates.alpha + (0.020911)*sailStates.beta + (0.449859)*sailStates.p + (-1.672133)*sailStates.q + (-0.015337)*sailStates.r + (-0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end