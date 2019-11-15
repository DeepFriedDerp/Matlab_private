function [aeroForces] = paramSpace_4_4_4_3_1_2_2(sailStates,airStates)

	CL = (3.816387)*sailStates.alpha + (-0.252118)*sailStates.beta + (-2.445800)*sailStates.p + (35.166550)*sailStates.q + (1.116716)*sailStates.r + (0.010342)*sailStates.de;
	CD = 0.073380;
	CY = (-0.062692)*sailStates.alpha + (-0.023075)*sailStates.beta + (0.319310)*sailStates.p + (-0.489618)*sailStates.q + (-0.063567)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.172857)*sailStates.alpha + (-0.209324)*sailStates.beta + (-1.097549)*sailStates.p + (9.266300)*sailStates.q + (0.800538)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-13.209807)*sailStates.alpha + (0.990017)*sailStates.beta + (7.927256)*sailStates.p + (-133.122269)*sailStates.q + (-3.766015)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.000943)*sailStates.alpha + (0.028058)*sailStates.beta + (-0.512102)*sailStates.p + (1.924515)*sailStates.q + (-0.014138)*sailStates.r + (0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end