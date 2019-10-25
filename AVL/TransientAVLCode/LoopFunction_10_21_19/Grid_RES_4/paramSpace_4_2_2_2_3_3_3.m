function [aeroForces] = paramSpace_4_2_2_2_3_3_3(sailStates,airStates)

	CL = (4.180447)*sailStates.alpha + (0.142722)*sailStates.beta + (-2.967529)*sailStates.p + (42.038002)*sailStates.q + (1.966823)*sailStates.r + (0.011601)*sailStates.de;
	CD = -0.365110;
	CY = (0.167481)*sailStates.alpha + (-0.024508)*sailStates.beta + (0.610739)*sailStates.p + (0.455226)*sailStates.q + (-0.121500)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.303829)*sailStates.alpha + (-0.278866)*sailStates.beta + (-1.535390)*sailStates.p + (14.078668)*sailStates.q + (1.585734)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-11.944548)*sailStates.alpha + (-0.522845)*sailStates.beta + (9.018191)*sailStates.p + (-146.782669)*sailStates.q + (-6.542585)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.543373)*sailStates.alpha + (0.063449)*sailStates.beta + (-1.143757)*sailStates.p + (3.775395)*sailStates.q + (-0.027162)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end