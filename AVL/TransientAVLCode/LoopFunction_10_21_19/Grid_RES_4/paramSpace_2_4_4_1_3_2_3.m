function [aeroForces] = paramSpace_2_4_4_1_3_2_3(sailStates,airStates)

	CL = (3.890862)*sailStates.alpha + (0.113471)*sailStates.beta + (-3.415271)*sailStates.p + (41.939144)*sailStates.q + (-0.874356)*sailStates.r + (0.011373)*sailStates.de;
	CD = -0.041180;
	CY = (0.108988)*sailStates.alpha + (-0.023349)*sailStates.beta + (-0.362102)*sailStates.p + (1.915493)*sailStates.q + (-0.023531)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (1.485816)*sailStates.alpha + (0.160749)*sailStates.beta + (-1.862317)*sailStates.p + (15.842723)*sailStates.q + (-0.643149)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-13.761679)*sailStates.alpha + (-0.306137)*sailStates.beta + (11.454756)*sailStates.p + (-159.650192)*sailStates.q + (2.899275)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (0.184097)*sailStates.alpha + (0.005582)*sailStates.beta + (0.659306)*sailStates.p + (-4.114895)*sailStates.q + (0.008470)*sailStates.r + (-0.000639)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end