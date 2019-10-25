function [aeroForces] = paramSpace_2_3_1_1_3_3_1(sailStates,airStates)

	CL = (5.043817)*sailStates.alpha + (-0.124228)*sailStates.beta + (-1.606708)*sailStates.p + (25.259989)*sailStates.q + (1.551479)*sailStates.r + (0.010074)*sailStates.de;
	CD = -1.670290;
	CY = (-0.086757)*sailStates.alpha + (-0.024296)*sailStates.beta + (0.714392)*sailStates.p + (1.471501)*sailStates.q + (0.046668)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (0.465382)*sailStates.alpha + (-0.451866)*sailStates.beta + (-0.439919)*sailStates.p + (2.206910)*sailStates.q + (1.550153)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-13.594599)*sailStates.alpha + (0.475376)*sailStates.beta + (6.098380)*sailStates.p + (-112.102478)*sailStates.q + (-5.251268)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (1.389604)*sailStates.alpha + (-0.027045)*sailStates.beta + (-1.686171)*sailStates.p + (6.705144)*sailStates.q + (-0.006961)*sailStates.r + (-0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end