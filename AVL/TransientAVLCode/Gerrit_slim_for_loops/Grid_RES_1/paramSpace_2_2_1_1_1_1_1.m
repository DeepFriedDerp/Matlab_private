function [aeroForces] = paramSpace_2_2_1_1_1_1_1(sailStates,airStates)

	CL = (5.222356)*sailStates.alpha + (-3.824181)*sailStates.beta + (-3.432355)*sailStates.p + (47.183720)*sailStates.q + (2.215403)*sailStates.r + (0.010449)*sailStates.de;
	CD = -5.854250;
	CY = (1.750229)*sailStates.alpha + (-0.242443)*sailStates.beta + (0.328505)*sailStates.p + (15.134191)*sailStates.q + (-0.034673)*sailStates.r + (0.002880)*sailStates.de;

	Cl = (-5.239280)*sailStates.alpha + (-1.233337)*sailStates.beta + (-1.661395)*sailStates.p + (14.120737)*sailStates.q + (2.437467)*sailStates.r + (0.001201)*sailStates.de;
	Cm = (5.242264)*sailStates.alpha + (17.202707)*sailStates.beta + (10.659191)*sailStates.p + (-150.870468)*sailStates.q + (-7.838279)*sailStates.r + (-0.055222)*sailStates.de;
	Cn = (-1.820886)*sailStates.alpha + (0.341530)*sailStates.beta + (-0.940621)*sailStates.p + (-8.289227)*sailStates.q + (-0.189586)*sailStates.r + (-0.003761)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end