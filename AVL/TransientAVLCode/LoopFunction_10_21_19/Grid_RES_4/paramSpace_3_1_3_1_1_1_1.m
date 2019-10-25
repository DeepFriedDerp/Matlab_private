function [aeroForces] = paramSpace_3_1_3_1_1_1_1(sailStates,airStates)

	CL = (5.029090)*sailStates.alpha + (-0.393185)*sailStates.beta + (-1.587327)*sailStates.p + (24.977463)*sailStates.q + (-1.561258)*sailStates.r + (0.009943)*sailStates.de;
	CD = -1.709120;
	CY = (0.093815)*sailStates.alpha + (-0.026512)*sailStates.beta + (-0.729745)*sailStates.p + (-1.471502)*sailStates.q + (0.047778)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (0.571481)*sailStates.alpha + (0.315509)*sailStates.beta + (-0.495987)*sailStates.p + (2.937872)*sailStates.q + (-1.570826)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.424636)*sailStates.alpha + (1.559765)*sailStates.beta + (6.034473)*sailStates.p + (-111.058342)*sailStates.q + (5.301627)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-1.338795)*sailStates.alpha + (-0.028666)*sailStates.beta + (1.713055)*sailStates.p + (-6.771587)*sailStates.q + (-0.007111)*sailStates.r + (0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end