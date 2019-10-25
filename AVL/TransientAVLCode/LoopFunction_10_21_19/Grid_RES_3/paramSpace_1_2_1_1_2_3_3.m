function [aeroForces] = paramSpace_1_2_1_1_2_3_3(sailStates,airStates)

	CL = (5.395123)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.209503)*sailStates.p + (35.482903)*sailStates.q + (1.045678)*sailStates.r + (0.009670)*sailStates.de;
	CD = -1.900230;
	CY = (0.337210)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.724132)*sailStates.p + (0.589407)*sailStates.q + (0.127628)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (1.792616)*sailStates.alpha + (-0.385572)*sailStates.beta + (-1.831055)*sailStates.p + (14.756501)*sailStates.q + (1.198987)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-14.791963)*sailStates.alpha + (0.000000)*sailStates.beta + (12.412713)*sailStates.p + (-159.507309)*sailStates.q + (-3.372623)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (-0.647407)*sailStates.alpha + (-0.067987)*sailStates.beta + (-1.975756)*sailStates.p + (9.792723)*sailStates.q + (-0.080087)*sailStates.r + (0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end