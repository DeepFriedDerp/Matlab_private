function [aeroForces] = paramSpace_1_3_2_2_3_1_3(sailStates,airStates)

	CL = (4.741800)*sailStates.alpha + (0.414221)*sailStates.beta + (-2.925637)*sailStates.p + (41.614132)*sailStates.q + (-2.228630)*sailStates.r + (0.011435)*sailStates.de;
	CD = -0.644230;
	CY = (-0.000507)*sailStates.alpha + (-0.022243)*sailStates.beta + (-0.831503)*sailStates.p + (1.027327)*sailStates.q + (-0.146616)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.721196)*sailStates.alpha + (0.503293)*sailStates.beta + (-1.454265)*sailStates.p + (13.232098)*sailStates.q + (-1.814358)*sailStates.r + (0.000688)*sailStates.de;
	Cm = (-12.781631)*sailStates.alpha + (-1.533271)*sailStates.beta + (8.706024)*sailStates.p + (-144.553238)*sailStates.q + (7.419615)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.320935)*sailStates.alpha + (0.061723)*sailStates.beta + (1.633168)*sailStates.p + (-7.292406)*sailStates.q + (0.013266)*sailStates.r + (-0.000438)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end