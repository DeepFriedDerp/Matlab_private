function [aeroForces] = paramSpace_1_1_1_1_1_2_1(sailStates,airStates)

	CL = (4.327527)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.863220)*sailStates.p + (25.503471)*sailStates.q + (0.564093)*sailStates.r + (0.008925)*sailStates.de;
	CD = -0.674480;
	CY = (-0.267676)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.519269)*sailStates.p + (-1.423509)*sailStates.q + (0.129623)*sailStates.r + (-0.000296)*sailStates.de;

	Cl = (1.184447)*sailStates.alpha + (-0.203706)*sailStates.beta + (-0.724524)*sailStates.p + (4.537444)*sailStates.q + (0.734098)*sailStates.r + (-0.000227)*sailStates.de;
	Cm = (-15.576312)*sailStates.alpha + (0.000000)*sailStates.beta + (7.747428)*sailStates.p + (-121.603668)*sailStates.q + (-1.653948)*sailStates.r + (-0.065245)*sailStates.de;
	Cn = (0.993113)*sailStates.alpha + (-0.050790)*sailStates.beta + (-1.310919)*sailStates.p + (7.456336)*sailStates.q + (-0.099219)*sailStates.r + (0.000514)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end