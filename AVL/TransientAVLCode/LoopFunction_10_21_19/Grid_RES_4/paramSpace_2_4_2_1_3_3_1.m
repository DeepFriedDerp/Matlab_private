function [aeroForces] = paramSpace_2_4_2_1_3_3_1(sailStates,airStates)

	CL = (5.029089)*sailStates.alpha + (-0.393185)*sailStates.beta + (-1.587327)*sailStates.p + (24.977463)*sailStates.q + (1.561258)*sailStates.r + (0.009943)*sailStates.de;
	CD = -1.709120;
	CY = (-0.093815)*sailStates.alpha + (-0.023061)*sailStates.beta + (0.729745)*sailStates.p + (1.471502)*sailStates.q + (0.047778)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (0.377938)*sailStates.alpha + (-0.527340)*sailStates.beta + (-0.398294)*sailStates.p + (1.729312)*sailStates.q + (1.577272)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.424635)*sailStates.alpha + (1.559765)*sailStates.beta + (6.034472)*sailStates.p + (-111.058342)*sailStates.q + (-5.301627)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (1.437362)*sailStates.alpha + (-0.026577)*sailStates.beta + (-1.706652)*sailStates.p + (6.692373)*sailStates.q + (-0.006688)*sailStates.r + (-0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end