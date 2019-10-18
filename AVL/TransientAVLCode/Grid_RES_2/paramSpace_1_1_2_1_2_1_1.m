function [aeroForces] = paramSpace_1_1_2_1_2_1_1(sailStates,airStates)

	CL = (7.127439)*sailStates.alpha + (0.468485)*sailStates.beta + (-2.570290)*sailStates.p + (29.794724)*sailStates.q + (0.368082)*sailStates.r + (0.008774)*sailStates.de;
	CD = -4.241680;
	CY = (1.715191)*sailStates.alpha + (-0.051682)*sailStates.beta + (-0.177250)*sailStates.p + (14.012843)*sailStates.q + (-0.022343)*sailStates.r + (0.002985)*sailStates.de;

	Cl = (-1.285426)*sailStates.alpha + (-0.450583)*sailStates.beta + (-1.451434)*sailStates.p + (12.276670)*sailStates.q + (0.938520)*sailStates.r + (0.000600)*sailStates.de;
	Cm = (-12.779092)*sailStates.alpha + (-2.178101)*sailStates.beta + (9.306447)*sailStates.p + (-138.154358)*sailStates.q + (-1.425434)*sailStates.r + (-0.068409)*sailStates.de;
	Cn = (-1.845159)*sailStates.alpha + (-0.042339)*sailStates.beta + (-0.200053)*sailStates.p + (-8.883071)*sailStates.q + (0.120638)*sailStates.r + (-0.003940)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end